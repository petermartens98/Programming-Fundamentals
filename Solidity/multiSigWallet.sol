// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Multi Signature Wallet Smart Contract in Solidity,
// which allows users to submit a transaction,
// approve and revoke the approval of pending transactions,
// also anyone can execute a transactions after enough owners have approved it 

contract MultiSigWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    event SubmitTransaction(
        address indexed owner,
        uint indexed txId,
        address indexed to,
        uint value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint indexed txId);
    event RevokeTransaction(address indexed owner, uint indexed txId);
    event ExecuteTransaction(address indexed owner, uint indexed txId);

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public isConfirmed;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint _txId) {
        require(_txId < transactions.length, "tx does not exist");
        _;
    }

    modifier notConfirmed(uint _txId) {
        require(!isConfirmed[_txId][msg.sender], "tx already confirmed");
        _;
    }

    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "tx already executed");
        _;
    }

    constructor(address[] memory _owners, uint _numConfirmationsRequired) {
        require(_owners.length > 0, "owners required for transaction");
        require(_numConfirmationsRequired > 0 && _numConfirmationsRequired <= _owners.length, "invalid required number of owners");

        for (uint i; i < _owners.length; i++){
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }
        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submitTransaction(address _to, uint _value, bytes memory _data) public onlyOwner{
        uint txId = transactions.length;

        transactions.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            executed: false,
            numConfirmations: 0
        }));
        emit SubmitTransaction(msg.sender, txId, _to, _value, _data);
    }

    function confirmTransaction(uint _txId) 
        public
        onlyOwner 
        txExists(_txId)
        notConfirmed(_txId)
        notExecuted(_txId)
    {
        Transaction storage transaction = transactions[_txId];
        transaction.numConfirmations += 1;
        isConfirmed[_txId][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txId);
    }

    function executeTransaction(uint _txId) 
        public
        onlyOwner
        txExists(_txId) 
        notExecuted(_txId) 
    {
            Transaction storage transaction = transactions[_txId];
            require(transaction.numConfirmations >=  numConfirmationsRequired, "cannot execute tx");

            transaction.executed = true;

            (bool success, ) = transaction.to.call{value: transaction.value}(
                transaction.data
            );
            require(success, "tx failed");
            emit ExecuteTransaction(msg.sender, _txId);
    }

    function revokeConfirmation(uint _txId) 
        public
        onlyOwner  
        txExists(_txId) 
        notExecuted(_txId)
    {
            Transaction storage transaction = transactions[_txId];

            require(isConfirmed[_txId][msg.sender], "tx not confirmed");
            transaction.numConfirmations -= 1;
            isConfirmed[_txId][msg.sender] = false;

            emit RevokeTransaction(msg.sender, _txId);
    }

    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    function getTransactionCount() public view returns (uint){
        return transactions.length;
    }

    function getTransaction(uint _txId)
        public
        view
        returns(
            address to,
            uint value,
            bytes memory data,
            bool executed,
            uint numConfirmations
        )
    {
                Transaction storage transaction = transactions[_txId];

                return(
                    transaction.to,
                    transaction.value,
                    transaction.data,
                    transaction.executed,
                    transaction.numConfirmations
                );
    }
}

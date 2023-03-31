.global _start
_start:
	LDR R0,=list	
	
.data
list:
	.word -2,4,8,2,6,-7

import React, { useState } from "react";
import moment from "moment";
import './App.css';

function Calendar() {
  const [selectedDate, setSelectedDate] = useState(moment());
  const [events, setEvents] = useState([]);

  const daysOfWeek = moment.weekdays();
  const monthDays = selectedDate.daysInMonth();
  const firstDayOfMonth = moment(selectedDate).startOf("month").format("d");

  const handleDateClick = (date) => {
    setSelectedDate(moment(date));
  };

  const handleEventClick = (event) => {
    // handle click event for an event on the calendar
  };

  const renderDaysOfWeek = () => {
    return moment.weekdaysShort().map((day) => (
      <div key={day} className="calendar__day-of-week">
        {day}
      </div>
    ));
  };
  const renderCalendarDays = () => {
    const blanks = [];
    for (let i = 0; i < firstDayOfMonth; i++) {
      blanks.push(<div key={i * 100} className="calendar__day calendar__day--blank"></div>);
    }

    const days = [];
    for (let d = 1; d <= monthDays; d++) {
      const date = moment(selectedDate).date(d);
      const isToday = moment().isSame(date, "day");
      const isSelected = moment(selectedDate).isSame(date, "day");
      const eventsForDay = events.filter((event) => moment(event.date).isSame(date, "day"));
      days.push(
        <div
          key={d}
          className={`calendar__day ${isToday ? "calendar__day--today" : ""} ${
            isSelected ? "calendar__day--selected" : ""
          }`}
          onClick={() => handleDateClick(date)}
        >
          <span>{d}</span>
          {eventsForDay.map((event) => (
            <div key={event.id} className="calendar__event" onClick={() => handleEventClick(event)}>
              {event.title}
            </div>
          ))}
        </div>
      );
    }

    return [...blanks, ...days];
  };

  const handlePrevMonthClick = () => {
    setSelectedDate(moment(selectedDate).subtract(1, "month"));
  };

  const handleNextMonthClick = () => {
    setSelectedDate(moment(selectedDate).add(1, "month"));
  };

  const renderHeader = () => {
    const monthYear = selectedDate.format("MMMM YYYY");

    const handleMonthChange = (e) => {
      const month = e.target.value;
      const newDate = moment(selectedDate).month(month);
      setSelectedDate(newDate);
    };
    
    const handleYearChange = (e) => {
      const year = e.target.value;
      const newDate = moment(selectedDate).year(year);
      setSelectedDate(newDate);
    };
    
    const renderMonthOptions = () => {
      return moment.months().map((month, index) => (
        <option key={index} value={index}>
          {month}
        </option>
      ));
    };
    
    const renderYearOptions = () => {
      const currentYear = moment().year();
      return Array.from({ length: 10 }, (_, i) => currentYear - i).map((year) => (
        <option key={year} value={year}>
          {year}
        </option>
      ));
    };
    
    return (
      <div className="calendar__header">
        <div className="calendar__prev-month" onClick={handlePrevMonthClick}>
          &lt;
        </div>
        <div className="calendar__month-year">
          <select value={selectedDate.month()} onChange={handleMonthChange}>
            {renderMonthOptions()}
          </select>
          <select value={selectedDate.year()} onChange={handleYearChange}>
            {renderYearOptions()}
          </select>
        </div>
        <div className="calendar__next-month" onClick={handleNextMonthClick}>
          &gt;
        </div>
      </div>
    );
  } 
    
  const handleAddEventClick = () => {
    // handle click event for adding a new event to the calendar
  };

  return (
    <div className="calendar">
      {renderHeader()}
      <div className="calendar__days-of-week">{renderDaysOfWeek()}</div>
      <div className="calendar__days">{renderCalendarDays()}</div>
      <div className="calendar__add-event" onClick={handleAddEventClick}></div>
    </div>
  );
}

export default Calendar;
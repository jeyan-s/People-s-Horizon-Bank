package com.bank.peopleshorizon.formatter;

import java.util.Date;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

public class LogFormatter extends Formatter 
{
    public String format(LogRecord record) 
    {
        return new Date(record.getMillis()) + "   " + record.getMessage() + "\n";
    }
}
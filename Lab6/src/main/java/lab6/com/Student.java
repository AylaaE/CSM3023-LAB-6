package lab6.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student {
    private String stuno;
    private String name;
    private String program;
    
    public String getStuno() {
        Pattern pt = Pattern.compile("[A-Z0-9]*");
        Matcher mt = pt.matcher(stuno);
        boolean bl = mt.matches();
        String valid = "";
        String invalid = "Invalid input, please re-enter!";
        if(bl) {
            valid = stuno;
        } else {
            valid = invalid;
        }
        return valid;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}

package model.bean;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Course {
    private String id;
    private String name;
    private String price;
    private String description;
    private Date startDate;
    private Date endDate;
    public Course(){}
    public Course(String id,String name, String price, String description, String startDate, String endDate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            this.startDate = sdf.parse(startDate);
            this.endDate = (endDate != null && !endDate.isEmpty()) ? sdf.parse(endDate) : null;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
package com.example.demo8.tasks;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "tasks2")
public class Tasks implements Serializable {

    private static final long serialVersionUID = -3009157732242241606L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "task_name")
    private String taskName;

    @Column(name = "description")
    private String description;

    @Column(name = "priority")
    @Enumerated(EnumType.STRING)
    private Priority priority;

    @Temporal(TemporalType.DATE)
    @Column(name = "data_create")
    private Date dataCreate;

    @Column(name = "done")
    private boolean done;

    @Column(name = "deleted")
    private boolean deleted;

    public Tasks() {
    }

    public Tasks(String taskName, String description, Priority priority, Date dataCreate, boolean done, boolean deleted) {
        this.taskName = taskName;
        this.description= description;
        this.priority= priority;
        this.dataCreate= dataCreate;
        this.done = done;
        this.deleted = deleted;
    }

    public enum Priority {
        LOW,
        MEDIUM,
        HIGH,
        IMPORTANT
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String tastName) {
        this.taskName = tastName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public Date getDataCreate() {
        return dataCreate;
    }

    public void setDataCreate(Date dataCreate) {
        this.dataCreate = dataCreate;
    }

}


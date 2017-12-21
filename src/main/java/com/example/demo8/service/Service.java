package com.example.demo8.service;

import java.util.ArrayList;
import java.util.List;
import com.example.demo8.repository.Repository;
import com.example.demo8.tasks.Tasks;
import org.springframework.beans.factory.annotation.Autowired;

@org.springframework.stereotype.Service
public class Service {

    @Autowired
    private Repository taskRepository;

    public List<Tasks> getAllTasks(){
        List<Tasks> tasks = new ArrayList<>();
        taskRepository.findAll()
                .forEach(tasks::add);
        return tasks;
    }

    public Tasks getTasks(long id){
        return taskRepository.findOne(id);
    }

    public void addTasks(Tasks tasks){
        taskRepository.save(tasks) ;
    }

    public void updateTasks(long id, Tasks tasks){
        taskRepository.save(tasks);
    }

    public void deleteTasks(long id){
        taskRepository.delete(id);
    }

    public List<Tasks> inProgres() {
        List<Tasks> tasks = new ArrayList<>();
        taskRepository.inProgres()
                .forEach(tasks::add);
        return tasks;
    }

    public List<Tasks> findDeleted() {
        List<Tasks> tasks = new ArrayList<>();
        taskRepository.findDeleted()
                .forEach(tasks::add);
        return tasks;
    }

    public List<Tasks> findDone() {
        List<Tasks> tasks = new ArrayList<>();
        taskRepository.findDone()
                .forEach(tasks::add);
        return tasks;
    }
}

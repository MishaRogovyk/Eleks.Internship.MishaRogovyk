package com.example.demo8.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo8.service.Service;
import com.example.demo8.tasks.Tasks;
import com.example.demo8.tasks.Tasks.Priority;
import java.text.SimpleDateFormat;
import java.util.Date;

@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    private Service taskService;

    @RequestMapping(value = "/tasks")
    public ModelAndView doHome() {
        ModelAndView mv = new ModelAndView("tasks");
        mv.addObject("task",taskService.inProgres());
        return mv;
    }

    @RequestMapping(value = "/completed")
    public ModelAndView done() {
        ModelAndView mv = new ModelAndView("completedTasks");
        mv.addObject("taskCompleted",taskService.findDone());
        return mv;
    }

    @RequestMapping(value = "/deleted")
    public ModelAndView delete() {
        ModelAndView mv = new ModelAndView("deletedTasks");
        mv.addObject("taskDeleted",taskService.findDeleted());
        return mv;
    }

    @RequestMapping( value = "/update/{id}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView("editTasks");
        mv.addObject("tasks",taskService.getTasks(id));
        return mv;
    }

    @InitBinder
    public void  initBinder(WebDataBinder binder){
        binder.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-mm-dd"),false));
    }

    @RequestMapping(value = "/addTask", method = RequestMethod.POST)
    public ModelAndView add(@RequestParam("id") String id, @RequestParam("task_name") String taskName,
                            @RequestParam("description") String description, @RequestParam("priority") Priority priority,
                            @RequestParam("data_create") Date dataCreate
    ) {
        ModelAndView mv = new ModelAndView("redirect:/tasks");
        Tasks tasks;
        if(!id.isEmpty()){
            tasks =(Tasks)taskService.getTasks(Long.parseLong(id));
        } else {
            tasks = new Tasks();
        }
        tasks.setTaskName(taskName);
        tasks.setDescription(description);
        tasks.setPriority(priority);
        tasks.setDataCreate(dataCreate);
        taskService.addTasks(tasks);
        return mv;
    }

    @RequestMapping( value = "/completed/{id}", method = RequestMethod.GET)
    public ModelAndView docom(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView("editCompleted");
        mv.addObject("tasks",taskService.getTasks(id));
        return mv;}

    @RequestMapping(value = "/editCompleted", method = RequestMethod.POST)
    public ModelAndView editDone(@RequestParam("id") String id,@RequestParam("done") boolean done) {
        ModelAndView mv = new ModelAndView("redirect:/tasks");
        Tasks tasks;
        if(!id.isEmpty()){
            tasks =(Tasks)taskService.getTasks(Long.parseLong(id));
        } else {
            tasks = new Tasks();
        }
        tasks.setDone(done);
        taskService.addTasks(tasks);
        return mv;
    }

    @RequestMapping( value = "/deleteCompleted/{id}", method = RequestMethod.GET)
    public ModelAndView doDeleteComplete(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/completed");
        taskService.deleteTasks(id);
        return mv;
    }

    @RequestMapping( value = "/deleted/{id}", method = RequestMethod.GET)
    public ModelAndView dodel(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView("editDeleted");
        mv.addObject("tasks",taskService.getTasks(id));
        return mv;}

    @RequestMapping(value = "/editDeleted", method = RequestMethod.POST)
    public ModelAndView editDeleted(@RequestParam("id") String id,@RequestParam("deleted") boolean deleted) {
        ModelAndView mv = new ModelAndView("redirect:/tasks");
        Tasks tasks;
        if(!id.isEmpty()){
            tasks =(Tasks)taskService.getTasks(Long.parseLong(id));
        } else {
            tasks = new Tasks();
        }
        tasks.setDeleted(deleted);
        taskService.addTasks(tasks);
        return mv;
    }

    @RequestMapping( value = "/deleteDeleted/{id}", method = RequestMethod.GET)
    public ModelAndView doDeleteDelete(@PathVariable("id") int id){
        ModelAndView mv = new ModelAndView("redirect:/deleted");
        taskService.deleteTasks(id);
        return mv;
    }
}

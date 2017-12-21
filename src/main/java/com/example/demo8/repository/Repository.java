package com.example.demo8.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo8.tasks.Tasks;

public interface Repository extends CrudRepository<Tasks, Long>{

    @Query(value = "SELECT * FROM tasks2 WHERE done=0 AND deleted=0", nativeQuery = true )
    List<Tasks> inProgres();

    @Query(value ="SELECT * FROM tasks2 WHERE done=1", nativeQuery = true )
    List<Tasks> findDone();

    @Query(value ="SELECT * FROM tasks2 WHERE deleted=1", nativeQuery = true )
    List<Tasks> findDeleted();
}



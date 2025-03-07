package com.example.mywebapp.repository; // update package if needed

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.mywebapp.model.Users;

public interface UserRepository extends JpaRepository<Users, Long> {
}

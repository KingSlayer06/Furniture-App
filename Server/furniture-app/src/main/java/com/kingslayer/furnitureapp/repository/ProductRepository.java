package com.kingslayer.furnitureapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kingslayer.furnitureapp.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    
}

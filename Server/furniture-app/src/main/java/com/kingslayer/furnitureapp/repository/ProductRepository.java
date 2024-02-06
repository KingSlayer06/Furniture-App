package com.kingslayer.furnitureapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kingslayer.furnitureapp.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    
    @Query(value = "SELECT * FROM product ORDER BY rand() LIMIT 5", nativeQuery = true)
    List<Product> getBanners();
}

package com.kingslayer.furnitureapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingslayer.furnitureapp.entity.Product;
import com.kingslayer.furnitureapp.repository.ProductRepository;
import com.kingslayer.furnitureapp.service.interfaces.IProductService;

import jakarta.transaction.Transactional;

@Service
public class ProductService implements IProductService {

    private ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Transactional
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
}

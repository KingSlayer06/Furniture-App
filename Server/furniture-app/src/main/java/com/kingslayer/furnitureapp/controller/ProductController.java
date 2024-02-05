package com.kingslayer.furnitureapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kingslayer.furnitureapp.service.interfaces.IProductService;
import com.kingslayer.furnitureapp.entity.Product;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    private IProductService productService;

    @Autowired
    public ProductController(IProductService productService) {
        this.productService = productService;
    }
    
    @GetMapping("/allProducts")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }
}

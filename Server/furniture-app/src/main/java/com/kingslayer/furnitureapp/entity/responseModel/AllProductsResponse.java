package com.kingslayer.furnitureapp.entity.responseModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.kingslayer.furnitureapp.entity.Product;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AllProductsResponse {
    private List<Product> banners;
    private List<Product> products;
}

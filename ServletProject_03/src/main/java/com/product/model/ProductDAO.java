package com.product.model;

import java.util.ArrayList;

public interface ProductDAO {

	// �߰�
		public void productInsert(Product product);
		// ��ü����
		public ArrayList<Product> proudctAllfind();
		// �󼼺���
		public Product findById(Long productId);
}

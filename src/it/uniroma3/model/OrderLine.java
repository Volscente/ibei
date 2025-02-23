package it.uniroma3.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.OneToOne;
import javax.persistence.Table;


	@Entity
	@Table(name = "order_line")
	@NamedQuery(name = "findAllOrderLines", query = "SELECT ol FROM OrderLine ol")
	public class OrderLine implements Serializable{
        
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToOne
	@Column(nullable = false)
	private Product product;

	@Column(nullable = false)
	private Float price;

	@Column(nullable = false)
	private Integer quantity;
	
//	@ManyToOne
//	private Order order;
	
	public OrderLine() {
    }

	public OrderLine(Product product, Float price, Integer quantity) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;
}

    //Getters & Setters        
	
//	public Order getOrder(){
//		return this.order;
//	}
//	
//	public void setOrder(Order order){
//		this.order = order;
//	}
    
   public Long getId() {
        return id;
    }
   
	public void setId(Long id) {
		this.id = id;
	}

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    public Float getPrice() {
        return this.price;
    }
    
    public Integer getQuantity() {
        return this.quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
	
//    public boolean equals(Object obj) {
//        OrderLine orderLine = (OrderLine)obj;
//        return this.getCode().equals(product.getCode());
//    }
//
//    public int hashCode() {
//         return this.code.hashCode();
//    }
	
}
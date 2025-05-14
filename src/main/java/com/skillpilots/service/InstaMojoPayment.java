package com.skillpilots.service;
//package com.skillpilots.service;
//
//import com.instamojo.wrapper.api.ApiContext;
//import com.instamojo.wrapper.api.Instamojo;
//import com.instamojo.wrapper.api.InstamojoImpl;
//import com.instamojo.wrapper.exception.ConnectionException;
//import com.instamojo.wrapper.model.PaymentOrder;
//
//public class InstaMojoPayment {
//
//
//    private final Instamojo api;
//
//    public InstaMojoPayment() {
//        ApiContext context = ApiContext.create(
//                "CLIENT_ID", 
//                "CLIENT_SECRET", 
//                ApiContext.Mode.TEST 
//        );
//        this.api = new InstaMojoPayment(context);
//    }
//
//    public PaymentOrderResponse createPayment(String name, String email, String phone, Double amount, String description, String redirectUrl, String webhookUrl, String transactionId) throws HTTPException, ConnectionException {
//        PaymentOrder order = new PaymentOrder();
//        order.setName(name);
//        order.setEmail(email);
//        order.setPhone(phone);
//        order.setCurrency("INR");
//        order.setAmount(amount);
//        order.setDescription(description);
//        order.setRedirectUrl(redirectUrl);
//        order.setWebhookUrl(webhookUrl);
//        order.setTransactionId(transactionId);
//
//        // Create a payment order
//        return api.createPaymentOrder(order);
//    }
//}
//	
//	
//}

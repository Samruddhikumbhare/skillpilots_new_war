//package com.skillpilots.controller.other;


//import org.springframework.stereotype.Controller;




/*

@Controller
public class PaymentController {

	porokhttp:
		Cashhse-CreateOrder.java
		Import java. 10. IDException,
		class CreateOrder
		public static void main(String args[]) throws IOException(
		OkHttpClient client = OkHttpClient().newBuilder()
		.build()
		RequestBody body MultipartBody.Builder().setType(Multipartlody.com)
		addFormDataPart(pold,
		addFormDataPart("secrethey,
		7705480780757)
		addFormDataPart(namede", salus order 105000867)
		addFormDataPartamen
		addFormDataPart("anderCurrency", "INR)
		.addFormDataPartstall", "sunas.gcsafree.com")
		addFormDataPart Hastane
		.addFormDataPart(customerfone, addFormDataPart(tumi)
		addFaramataPartnerful",
		addFurmDataPart(anderete,This is optional field as well")
		build(); Request request Request Builder()
		wrthatottest.confces.com/apt/sirenter/comate")
		method("POST", body) build
		Response response client.newCall(request).execute():
		System.out.println(response.body).toString())
	
 
	
	
	
	
}

*/

package com.skillpilots.controller.other;

import okhttp3.*;
import okhttp3.RequestBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillpilots.model.PaymentHistory;
import com.skillpilots.model.PlanDetails;
import com.skillpilots.model.User;
import com.skillpilots.repository.PaymentHistoryRepo;
import com.skillpilots.service.PaymentHistoryService;
import com.skillpilots.service.PlanDetailsService;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@CrossOrigin(origins = "*") 
@Controller
public class PaymentController {

    private static final String CASHFREE_API_URL = "https://sandbox.cashfree.com/pg/orders";
    private static final String CLIENT_ID = "TEST10325813c45c848ac662fcaedc5531852301";
    private static final String CLIENT_SECRET = "cfsk_ma_test_c68c8a5bd31d3a184f44e5cf3b12dc93_76c0dc26";

    private final OkHttpClient client = new OkHttpClient();
    @Autowired
    private PlanDetailsService planDetailsService;
    @Autowired
    private HttpSession session;
    @Autowired
    private PaymentHistoryService paymentHistoryService;
    @Autowired
    private PaymentHistoryRepo paymentHistoryRepo;
//
//    @PostMapping("/createOrder")
//    @ResponseBody
//    public ResponseEntity<Map<String, String>> createOrder(@org.springframework.web.bind.annotation.RequestBody Map<String, String> orderData) {
//        OkHttpClient client = new OkHttpClient();
//
//        String jsonBody = "{"
//                + "\"order_amount\": " + orderData.getOrDefault("orderAmount", "100.00") + ","
//                + "\"order_currency\": \"INR\","
//                + "\"customer_details\": {"
//                + "   \"customer_id\": \"" + orderData.getOrDefault("orderId", "default_order_id") + "\","
//                + "   \"customer_name\": \"" + orderData.getOrDefault("customerName", "John Doe") + "\","
//                + "   \"customer_email\": \"test@example.com\","
//                + "   \"customer_phone\": \"" + orderData.getOrDefault("customerPhone", "7705480780") + "\""
//                + "},"
//                + "\"order_meta\": {"
//                + "   \"return_url\": \"" + orderData.getOrDefault("returnUrl", "https://yourwebsite.com/return") + "\","
//                + "   \"notify_url\": \"" + orderData.getOrDefault("notifyUrl", "https://yourwebsite.com/notify") + "\""
//                + "}"
//                + "}";
//
//        RequestBody body = RequestBody.create(MediaType.parse("application/json"), jsonBody);
//
//        Request request = new Request.Builder()
//                .url("https://sandbox.cashfree.com/pg/orders")
//                .post(body)
//                .addHeader("Content-Type", "application/json")
//                .addHeader("x-client-id", CLIENT_ID)
//                .addHeader("x-client-secret", CLIENT_SECRET)
//                .addHeader("x-api-version", "2023-08-01")
//                .build();
//
//        try (Response response = client.newCall(request).execute()) {
//            if (response.isSuccessful()) {
//                String responseBody = response.body().string();
//                System.out.println("Cashfree API Response: " + responseBody); // Log the full response body
//
//                ObjectMapper objectMapper = new ObjectMapper();
//                Map<String, Object> responseMap = objectMapper.readValue(responseBody, new TypeReference<Map<String, Object>>() {});
//
//                Map<String, String> result = new HashMap<>();
//                result.put("payment_link", responseMap.get("payment_link").toString());
//
//                return ResponseEntity.ok(result);
//            } else {
//                return ResponseEntity.status(response.code()).body(Collections.singletonMap("error", "Payment API Error: " + response.message()));
//            }
//        } catch (IOException e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", e.getMessage()));
//        }
//    }
    
    @PostMapping("/createOrder")
    public ResponseEntity<Map<String, String>> createOrder(@org.springframework.web.bind.annotation.RequestBody Map<String, String> orderData) {
        OkHttpClient client = new OkHttpClient();
        
        String jsonBody = "{"
                + "\"order_amount\": " + orderData.getOrDefault("orderAmount", "100.00") + ","
                + "\"order_currency\": \"INR\","
                + "\"customer_details\": {"
                + " \"customer_id\": \"" + "OrdId"+LocalDateTime.now() + "\","
                + " \"customer_name\": \"" + orderData.getOrDefault("customerName", "John Doe") + "\","
                + " \"customer_email\": \""+orderData.get("email")+ ","
                + " \"customer_phone\": \"" + orderData.getOrDefault("customerPhone", "7705480780") + "\""
                + "},"
                + "\"order_meta\": {"
                + " \"return_url\": \"" + orderData.getOrDefault("returnUrl", "https://yourwebsite.com/return") + "\","
                + " \"notify_url\": \"" + orderData.getOrDefault("notifyUrl", "https://yourwebsite.com/notify") + "\""
                + "}"
                + "}";
        
        RequestBody body = RequestBody.create(MediaType.parse("application/json"), jsonBody);
        Request request = new Request.Builder()
                .url("https://sandbox.cashfree.com/pg/orders")
                .post(body)
                .addHeader("Content-Type", "application/json")
                .addHeader("x-client-id", CLIENT_ID)
                .addHeader("x-client-secret", CLIENT_SECRET)
                .addHeader("x-api-version", "2025-01-01")
                .build();
        
        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                String responseBody = response.body().string();
                // Convert response to a Map
                ObjectMapper objectMapper = new ObjectMapper();
                Map<String, Object> responseMap = objectMapper.readValue(responseBody, new TypeReference<Map<String, Object>>() {});
                
                // Extract the payment session ID
                String paymentSessionId = responseMap.get("payment_session_id").toString();
                
                
                // Construct the payment URL
                String paymentUrl = "https://payments.cashfree.com/session/" + paymentSessionId;
                
                // Return the payment URL
                Map<String, String> result = new HashMap<>();
                result.put("payment_url", paymentUrl);
                // Redirect the user to the Cashfree payment page
                return ResponseEntity.status(HttpStatus.FOUND)
                        .header("Location", paymentUrl)  // Redirect to the payment URL
                        .build();            } else {
                return ResponseEntity.status(response.code()).body(Collections.singletonMap("error", "Payment API Error: " + response.message()));
            }
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", e.getMessage()));
        }
    }
    @GetMapping("/payment-success")
    @ResponseBody  // Ensure this returns JSON instead of redirecting
    public ResponseEntity<Map<String, String>> paymentSuccess(@RequestParam Long userId) {
        // Fetch payment record
        PaymentHistory payment = paymentHistoryService.getPayment(userId);
        
        if (payment == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Collections.singletonMap("error", "Payment not found"));
        }
        
        // Update status to "success"
        payment.setStatus("success");

        // Generate a unique receipt number
        String receiptNumber = generateReceiptNumber();
        payment.setReceiptNumber(receiptNumber);

        // Save updated payment details
        paymentHistoryService.save(payment);

        // Return JSON response
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("receiptNumber", receiptNumber);

        return ResponseEntity.ok(response);
    }

    
    
    
    
    
	@GetMapping("/paymentpage")
	public String paymentPage(Model model) {
        User user = (User) session.getAttribute("user");
        PlanDetails planDetails=null;
        if(user.getRole().equals("10")) {
    		 planDetails = planDetailsService.getPlanDetails("1");

        }else if( user.getRole().equals("0")){
   		 planDetails = planDetailsService.getPlanDetails("1");

        }
        
        System.out.println("plannnnnnnnnn"+ planDetails);
        model.addAttribute("plan", planDetails);
		return "payment_page";

	}

    
    
    
	 @GetMapping("/check-payment-status")
	 @ResponseBody
	    public ResponseEntity<Map<String, String>> checkPaymentStatus(@RequestParam Long userId) {
	        PaymentHistory payment = paymentHistoryService.getPayment(userId);
	        
	        Map<String, String> response = new HashMap<>();
	        response.put("status", (payment != null && "success".equals(payment.getStatus())) ? "success" : "pending");

	        return ResponseEntity.ok(response);
	    }
	 @GetMapping("/check")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> checkPayment(@RequestParam Long userId) {
	     PaymentHistory payment = paymentHistoryRepo.findTopByUserIdAndStatusOrderByPaymentDateDesc(userId, "success");

	     System.out.println("ssssssssssssssssssssss"+ payment);
	     boolean hasPaid = payment != null;

	     Map<String, Object> response = new HashMap<>();
	     response.put("success", hasPaid);

	     return ResponseEntity.ok(response);
	 }
	 public String generateReceiptNumber() {
		    Year currentYear = Year.now();
		    Year nextYear = currentYear.plusYears(1);
		    String financialYear = currentYear + "-" + nextYear.toString().substring(2); // 2025-26

		    String lastReceipt = paymentHistoryRepo.findLastReceiptNumber(financialYear);

		    int newSerialNumber = 1; // Default serial number

		    if (lastReceipt != null) {
		        String[] parts = lastReceipt.split("/");
		        int lastSerial = Integer.parseInt(parts[2]); // Convert to integer

		        newSerialNumber = lastSerial + 1;
		    }

		    String newSerialFormatted = String.format("%03d", newSerialNumber);

		    return "SP/" + financialYear + "/" + newSerialFormatted;
		}



}

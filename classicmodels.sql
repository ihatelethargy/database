-- classicmodels

USE classicmodels;

-- (1) 취소된 주문의 주문번호, 고객 명, 담당 직원 명(last name), 주문날짜, 그리고 comment 

-- 담당직원이 없는경우 미포함 -> INNER JOIN
SELECT o.orderNumber, c.customerName, e.lastName AS EmployeeName, o.orderDate, o.comments
FROM orders o 
JOIN customers c
ON o.customerNumber = c.customerNumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE status = 'Cancelled';

-- 당당직원이 없는경우도 포함 -> OUTER JOIN
SELECT o.orderNumber, c.customerName, e.lastName AS EmployeeName, o.orderDate, o.comments
FROM orders o
JOIN customers c
ON  o.customerNumber = c.customerNumber  -- 여기까진 같고 employees 와 left join (대상은 INNER JOIN 된것)
LEFT OUTER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE status = 'Cancelled';

-- (2) 주문번호 10100 에 의해 주문된 모든 제품 이름
SELECT p.productName 
FROM OrderDetails od
JOIN Products p
ON od.ProductCode = p.ProductCode
WHERE od.OrderNumber = 10100;



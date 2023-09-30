
SELECT c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount = (SELECT MAX(TotalAmount) FROM Orders);


SELECT o.OrderID, o.TotalAmount
FROM Orders o
WHERE CustomerID IN (SELECT c.CustomerID
		     FROM Customers c
                     JOIN Orders o ON c.CustomerID = o.CustomerID
                     WHERE o.TotalAmount = (SELECT MAX(TotalAmount) FROM Orders)
                     )
ORDER BY o.TotalAmount DESC;


SELECT c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);
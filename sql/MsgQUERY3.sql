SELECT TOP 1 * FROM Messages m
WHERE m.ReceiverID = 'B22DCCN003'
AND NOT EXISTS (
	SELECT 1
	FROM Friendships f
	WHERE (f.UserID1 = m.SenderID AND f.UserID2 = 'B22DCCN003' and f.Status = 'accepted') OR
		(f.UserID1 = 'B22DCCN003' AND f.UserID2 = m.SenderID and f.Status = 'accepted')
)
AND NOT EXISTS (
	SELECT 1
	FROM Messages m2
	WHERE m2.SenderID = 'B22DCCN003' AND m2.ReceiverID = m.SenderID
)
AND m.IsDeleted = 0
ORDER BY Timestamp DESC

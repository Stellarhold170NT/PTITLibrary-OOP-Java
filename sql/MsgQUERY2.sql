SELECT m.Id, m.SenderID, m.ReceiverID, m.IsDeleted, m.content, m.is_read, m.Timestamp FROM Messages m JOIN
(
	SELECT SenderID, ReceiverID, MAX(Timestamp) as Lastest
	FROM Messages
	GROUP BY SenderID, ReceiverID
	HAVING SenderID = 'B22DCCN003'
) AS LastestSend ON m.SenderID = LastestSend.SenderID AND m.ReceiverID = LastestSend.ReceiverID AND m.Timestamp = LastestSend.Lastest
WHERE m.IsDeleted = 0
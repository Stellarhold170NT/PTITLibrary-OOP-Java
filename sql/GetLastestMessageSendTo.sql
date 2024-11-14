CREATE PROCEDURE GetLastestMessageSendTo
	@USER VARCHAR(20)
AS
BEGIN
	SELECT m.id, m.SenderID, m.ReceiverID, m.IsDeleted, m.is_read, m.content, m.Timestamp
FROM Messages m
JOIN (
	SELECT SenderID, MAX(Timestamp) as LastestTime
	FROM Messages
	WHERE ReceiverID = @USER
	GROUP BY SenderID
) AS LastestMessages ON m.SenderID = LastestMessages.SenderID AND m.Timestamp = LastestMessages.LastestTime
WHERE m.ReceiverID = @USER
AND (
	EXISTS (
		SELECT 1
		FROM Friendships f
		WHERE (f.UserID1 = m.SenderID AND f.UserID2 = @USER and f.Status = 'accepted') OR
		(f.UserID1 = @USER AND f.UserID2 = m.SenderID and f.Status = 'accepted')
	) 
	OR
	EXISTS (
		SELECT 1
		FROM Messages m3
		WHERE m.SenderID = m3.ReceiverID AND m3.SenderID = @USER
	)
)
AND m.IsDeleted = 0
END
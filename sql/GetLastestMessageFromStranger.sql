CREATE PROCEDURE GetLastestMessageFromStranger
	@USER VARCHAR(20)
AS
BEGIN
SELECT TOP 1 * FROM Messages m
WHERE m.ReceiverID = @USER
AND NOT EXISTS (
	SELECT 1
	FROM Friendships f
	WHERE (f.UserID1 = m.SenderID AND f.UserID2 = @USER and f.Status = 'accepted') OR
		(f.UserID1 = @USER AND f.UserID2 = m.SenderID and f.Status = 'accepted')
)
AND NOT EXISTS (
	SELECT 1
	FROM Messages m2
	WHERE m2.SenderID = @USER AND m2.ReceiverID = m.SenderID
)
AND m.IsDeleted = 0
ORDER BY Timestamp DESC


END
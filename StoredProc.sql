CREATE PROCEDURE [dbo].[USP_GetStudentScheduleTracker]
@student_id INT
AS
BEGIN
	SELECT s.student_id
		,s.student_name
		,c.classroom_id
		,c.classroom_name
		,co.course_id
		,co.course_name
		,su.subject_id
		,su.subject_name
		,su.subject_duration
		,SUM(su.subject_duration) OVER (PARTITION BY co.course_id) AS total_course_duration
		,case when scd.schedule_end_time is not null then 'Completed' else 'In Progress' end as Status
		,scd.schedule_start_time
		,scd.schedule_end_time
	FROM students s
	INNER JOIN students_classrooms sc ON s.student_id = sc.student_id
	INNER JOIN classrooms c ON sc.classroom_id = c.classroom_id
	INNER JOIN classroom_course_association cca ON c.classroom_id = cca.classroom_id
	INNER JOIN courses co ON cca.course_id = co.course_id
	INNER JOIN subjects_course_association sca ON co.course_id = sca.course_id
	INNER JOIN subjects su ON sca.subject_id = su.subject_id
	INNER JOIN schedules scd ON cca.schedule_id = scd.schedule_id
	
WHERE s.student_id = @student_id
END



---EXEC GetScheduleTracker @student_id = 123;
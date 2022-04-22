-- Fetch Subject Function
CREATE OR REPLACE FUNCTION get_subjects()
    RETURNS TABLE (
        id INT,
        abbreviation VARCHAR,
        name VARCHAR
    )
    LANGUAGE plpgsql
    SECURITY DEFINER
AS $$
    BEGIN
        RETURN QUERY
        SELECT
            subject_id,
            subject_abbreviation,
            subject_name
        FROM subjects;
    END
$$;

GRANT ALL ON FUNCTION get_subjects TO backend;

-- Add Subject Function
CREATE OR REPLACE FUNCTION add_subject(
    p_abbreviation VARCHAR,
    p_name VARCHAR
)
    RETURNS TABLE (
        id INT,
        abbreviation VARCHAR,
        name VARCHAR
    )
    LANGUAGE plpgsql
    SECURITY DEFINER
AS $$
    BEGIN
        RETURN QUERY
        INSERT INTO
            subjects(subject_abbreviation, subject_name)
        VALUES (p_abbreviation, p_name)
        RETURNING
            subject_id,
            subject_abbreviation,
            subject_name;
    END
$$;

GRANT ALL ON FUNCTION add_subject TO backend;
--------------------------------------------------------------------------------
--                            Development presets                             --
--------------------------------------------------------------------------------


-- Sample data for manual tests and previews
DO
$add_development_presets$ BEGIN
    -- User you can log in as
    -- Password = password
    PERFORM add_unverified_user('Default', 'User', 'default.user@ost.ch', '$2a$10$cDazn1uv0sSaQ1KosKQ5/edSE04vP0D5YSlFKO6YceUVPkhop0YGi', 'verifyUser', NOW());
    PERFORM do_verify_user('verifyUser');
    PERFORM add_group(
        'My own grou',
        (SELECT id FROM users ORDER BY id DESC LIMIT 1),
        (SELECT id FROM subjects ORDER BY id ASC LIMIT 1),
        'Default defaults to default',
        5,
        NOW(),
        NOW() + '6 weeks'::interval
    );

    -- Sample user requesting access to default users's group
    PERFORM add_unverified_user('Max', 'Müller', 'max.mueller@ost.ch', '$2a$10$ZMaMQ2vJpZi/OsqeQFKHQeLP3gMxxPzlf66/KczNXs8T3KNxUSuKa', 'verifyMaxMueller', NOW());
    PERFORM do_verify_user('verifyMaxMueller');
    PERFORM add_application(
        (SELECT id FROM users WHERE email = 'max.mueller@ost.ch' LIMIT 1),
        (SELECT id FROM groups ORDER BY id DESC LIMIT 1),
        'Hi, i would like to join your team.',
        NOW()
    );

    -- Sample foreign user
    PERFORM add_unverified_user('Peter', 'Lustig', 'peter.lustig@ost.ch', '$2a$10$ZMaMQ2vJpZi/OsqeQFKHQeLP3gMxxPzlf66/KczNXs8T3KNxUSuKa', 'verifyPeterLustig', NOW());
    PERFORM do_verify_user('verifyPeterLustig');
    PERFORM add_group(
        'Peters lustige Gruppe',
        (SELECT id FROM users ORDER BY id DESC LIMIT 1),
        (SELECT id FROM subjects ORDER BY id ASC LIMIT 1),
        'Peter hackt die Welt',
        4,
        NOW(),
        NOW() + '3 weeks'::interval
    );

END $add_development_presets$;

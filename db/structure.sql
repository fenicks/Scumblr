CREATE TABLE event_changes (
    id integer NOT NULL,
    event_id integer,
    field character varying(255),
    new_value text,
    old_value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    old_value_key integer,
    new_value_key integer,
    value_class character varying(255)
);
CREATE TABLE events (
    id integer NOT NULL,
    action character varying(255),
    source character varying(255),
    details text,
    date timestamp without time zone,
    user_id integer,
    eventable_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    eventable_type character varying(255)
);
CREATE TABLE flags (
    id integer NOT NULL,
    name character varying(255),
    color character varying(255),
    workflow_id integer,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE result_attachments (
    id integer NOT NULL,
    result_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    attachment_file_name character varying(255),
    attachment_content_type character varying(255),
    attachment_file_size integer,
    attachment_updated_at timestamp without time zone,
    attachment_fingerprint character varying(255)
);
CREATE TABLE result_flags (
    id integer NOT NULL,
    stage_id integer,
    workflow_id integer,
    flag_id integer,
    result_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE results (
    id integer NOT NULL,
    title character varying(255),
    url character varying(255),
    status_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    domain character varying(255),
    user_id integer,
    content text,
    metadata_archive text,
    metadata jsonb,
    metadata_hash character varying(255)
);
CREATE TABLE saved_filters (
    id integer NOT NULL,
    name character varying(255),
    query text,
    user_id integer,
    public boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    saved_filter_type character varying(255),
    store_index_columns boolean,
    index_columns text
);
CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);
CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE statuses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    closed boolean,
    is_invalid boolean,
    "default" boolean DEFAULT false
);
CREATE TABLE subscribers (
    id integer NOT NULL,
    subscribable_id integer,
    subscribable_type character varying(255),
    email character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE summaries (
    id integer NOT NULL,
    summarizable_id integer,
    summarizable_type character varying(255),
    "timestamp" timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE system_metadata (
    id integer NOT NULL,
    key character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    metadata jsonb
);
CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    taggable_type character varying(255)
);
CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    color character varying(255),
    value character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
CREATE TABLE task_results (
    id integer NOT NULL,
    result_id integer,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
CREATE TABLE tasks (
    id integer NOT NULL,
    task_type character varying(255),
    options text,
    name character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    query text,
    enabled boolean DEFAULT true,
    "group" integer DEFAULT 1,
    metadata jsonb
);
CREATE TABLE user_saved_filters (
    id integer NOT NULL,
    user_id integer,
    saved_filter_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE workflowable_actions (
    id integer NOT NULL,
    name character varying(255),
    options text,
    action_plugin character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer
);
CREATE TABLE workflowable_stage_actions (
    id integer NOT NULL,
    stage_id integer,
    action_id integer,
    event character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE workflowable_stage_next_steps (
    id integer NOT NULL,
    current_stage_id integer,
    next_stage_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE workflowable_stages (
    id integer NOT NULL,
    name character varying(255),
    workflow_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE workflowable_workflow_actions (
    id integer NOT NULL,
    workflow_id integer,
    action_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE TABLE workflowable_workflows (
    id integer NOT NULL,
    name character varying(255),
    initial_stage_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
INSERT INTO schema_migrations (version) VALUES ('20140116225320');

INSERT INTO schema_migrations (version) VALUES ('20140116225320');

INSERT INTO schema_migrations (version) VALUES ('20140116230348');

INSERT INTO schema_migrations (version) VALUES ('20140116230348');

INSERT INTO schema_migrations (version) VALUES ('20140303185937');

INSERT INTO schema_migrations (version) VALUES ('20140303185937');

INSERT INTO schema_migrations (version) VALUES ('20140311154531');

INSERT INTO schema_migrations (version) VALUES ('20140311154531');

INSERT INTO schema_migrations (version) VALUES ('20140311180003');

INSERT INTO schema_migrations (version) VALUES ('20140311180003');

INSERT INTO schema_migrations (version) VALUES ('20140311181057');

INSERT INTO schema_migrations (version) VALUES ('20140311181057');

INSERT INTO schema_migrations (version) VALUES ('20140311223343');

INSERT INTO schema_migrations (version) VALUES ('20140311223343');

INSERT INTO schema_migrations (version) VALUES ('20140311232843');

INSERT INTO schema_migrations (version) VALUES ('20140311232843');

INSERT INTO schema_migrations (version) VALUES ('20140311233611');

INSERT INTO schema_migrations (version) VALUES ('20140311233611');

INSERT INTO schema_migrations (version) VALUES ('20140312014829');

INSERT INTO schema_migrations (version) VALUES ('20140312014829');

INSERT INTO schema_migrations (version) VALUES ('20140312014958');

INSERT INTO schema_migrations (version) VALUES ('20140312014958');

INSERT INTO schema_migrations (version) VALUES ('20140313003238');

INSERT INTO schema_migrations (version) VALUES ('20140313003238');

INSERT INTO schema_migrations (version) VALUES ('20140319003839');

INSERT INTO schema_migrations (version) VALUES ('20140319003839');

INSERT INTO schema_migrations (version) VALUES ('20140320154956');

INSERT INTO schema_migrations (version) VALUES ('20140320154956');

INSERT INTO schema_migrations (version) VALUES ('20140320155157');

INSERT INTO schema_migrations (version) VALUES ('20140320155157');

INSERT INTO schema_migrations (version) VALUES ('20140321165314');

INSERT INTO schema_migrations (version) VALUES ('20140321165314');

INSERT INTO schema_migrations (version) VALUES ('20140324211908');

INSERT INTO schema_migrations (version) VALUES ('20140324211908');

INSERT INTO schema_migrations (version) VALUES ('20140325175623');

INSERT INTO schema_migrations (version) VALUES ('20140325175623');

INSERT INTO schema_migrations (version) VALUES ('20140422210107');

INSERT INTO schema_migrations (version) VALUES ('20140422210107');

INSERT INTO schema_migrations (version) VALUES ('20140422210149');

INSERT INTO schema_migrations (version) VALUES ('20140422210149');

INSERT INTO schema_migrations (version) VALUES ('20140422223956');

INSERT INTO schema_migrations (version) VALUES ('20140422223956');

INSERT INTO schema_migrations (version) VALUES ('20140422223957');

INSERT INTO schema_migrations (version) VALUES ('20140422223957');

INSERT INTO schema_migrations (version) VALUES ('20140422223958');

INSERT INTO schema_migrations (version) VALUES ('20140422223958');

INSERT INTO schema_migrations (version) VALUES ('20140422223959');

INSERT INTO schema_migrations (version) VALUES ('20140422223959');

INSERT INTO schema_migrations (version) VALUES ('20140422223960');

INSERT INTO schema_migrations (version) VALUES ('20140422223960');

INSERT INTO schema_migrations (version) VALUES ('20140422223961');

INSERT INTO schema_migrations (version) VALUES ('20140422223961');

INSERT INTO schema_migrations (version) VALUES ('20140422223962');

INSERT INTO schema_migrations (version) VALUES ('20140422223962');

INSERT INTO schema_migrations (version) VALUES ('20140425230055');

INSERT INTO schema_migrations (version) VALUES ('20140425230055');

INSERT INTO schema_migrations (version) VALUES ('20140501180819');

INSERT INTO schema_migrations (version) VALUES ('20140501180819');

INSERT INTO schema_migrations (version) VALUES ('20140520180511');

INSERT INTO schema_migrations (version) VALUES ('20140520180511');

INSERT INTO schema_migrations (version) VALUES ('20140708174418');

INSERT INTO schema_migrations (version) VALUES ('20140708174418');

INSERT INTO schema_migrations (version) VALUES ('20140922200437');

INSERT INTO schema_migrations (version) VALUES ('20140922200437');

INSERT INTO schema_migrations (version) VALUES ('20140922200438');

INSERT INTO schema_migrations (version) VALUES ('20140922200438');

INSERT INTO schema_migrations (version) VALUES ('20150324190835');

INSERT INTO schema_migrations (version) VALUES ('20150324190835');

INSERT INTO schema_migrations (version) VALUES ('20150526174549');

INSERT INTO schema_migrations (version) VALUES ('20150526174549');

INSERT INTO schema_migrations (version) VALUES ('20150528174243');

INSERT INTO schema_migrations (version) VALUES ('20150528174243');

INSERT INTO schema_migrations (version) VALUES ('20150528201240');

INSERT INTO schema_migrations (version) VALUES ('20150528201240');

INSERT INTO schema_migrations (version) VALUES ('20150603213217');

INSERT INTO schema_migrations (version) VALUES ('20150603213217');

INSERT INTO schema_migrations (version) VALUES ('20150603213235');

INSERT INTO schema_migrations (version) VALUES ('20150603213235');

INSERT INTO schema_migrations (version) VALUES ('20150609203000');

INSERT INTO schema_migrations (version) VALUES ('20150609203000');

INSERT INTO schema_migrations (version) VALUES ('20150609203030');

INSERT INTO schema_migrations (version) VALUES ('20150609203030');

INSERT INTO schema_migrations (version) VALUES ('20150610174010');

INSERT INTO schema_migrations (version) VALUES ('20150610174010');

INSERT INTO schema_migrations (version) VALUES ('20150611181533');

INSERT INTO schema_migrations (version) VALUES ('20150611181533');

INSERT INTO schema_migrations (version) VALUES ('20150626175252');

INSERT INTO schema_migrations (version) VALUES ('20150626175252');

INSERT INTO schema_migrations (version) VALUES ('20150727171144');

INSERT INTO schema_migrations (version) VALUES ('20150727171144');

INSERT INTO schema_migrations (version) VALUES ('20150727201922');

INSERT INTO schema_migrations (version) VALUES ('20150727201922');

INSERT INTO schema_migrations (version) VALUES ('20150803212059');

INSERT INTO schema_migrations (version) VALUES ('20150803212059');

INSERT INTO schema_migrations (version) VALUES ('20151216190245');

INSERT INTO schema_migrations (version) VALUES ('20151216190245');

INSERT INTO schema_migrations (version) VALUES ('20160115230746');

INSERT INTO schema_migrations (version) VALUES ('20160115230746');

INSERT INTO schema_migrations (version) VALUES ('20160218172906');

INSERT INTO schema_migrations (version) VALUES ('20160218172906');

INSERT INTO schema_migrations (version) VALUES ('20160629192755');

INSERT INTO schema_migrations (version) VALUES ('20160629192755');

INSERT INTO schema_migrations (version) VALUES ('20160804194709');

INSERT INTO schema_migrations (version) VALUES ('20160804194709');


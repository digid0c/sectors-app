--liquibase formatted sql

--changeset digid0c:create_person_table logicalFilePath:db/changelog/changes/10
DROP TABLE IF EXISTS person CASCADE;

CREATE TABLE person
(
    id               BIGSERIAL      PRIMARY KEY,
    name             VARCHAR(200)   NOT NULL,
    agree_to_terms   BOOLEAN        NOT NULL
);
--rollback drop table person cascade;

--changeset digid0c:create_person_name_uq logicalFilePath:db/changelog/changes/10
ALTER TABLE person
ADD CONSTRAINT uq_person_name UNIQUE (name);
--rollback alter table person drop constraint if exists uq_person_name;
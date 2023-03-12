--liquibase formatted sql

--changeset digid0c:create_sector_table logicalFilePath:db/changelog/changes/20
DROP TABLE IF EXISTS sector CASCADE;

CREATE TABLE sector
(
    id          BIGSERIAL      PRIMARY KEY,
    name        VARCHAR(200)   NOT NULL,
    parent_id   BIGINT
);
--rollback drop table sector cascade;

--changeset digid0c:create_sector_table_sector_table_fk logicalFilePath:db/changelog/changes/20
ALTER TABLE sector
ADD CONSTRAINT fk_sector_sector FOREIGN KEY (parent_id) REFERENCES sector (id) ON DELETE CASCADE ON UPDATE CASCADE;
--rollback alter table sector drop foreign key if exists fk_sector_sector;
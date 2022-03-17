<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220217082104 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE knowledge (id INT AUTO_INCREMENT NOT NULL, parent_id_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(3000) DEFAULT NULL, INDEX IDX_9E072E1DB3750AF4 (parent_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE knowledge ADD CONSTRAINT FK_9E072E1DB3750AF4 FOREIGN KEY (parent_id_id) REFERENCES knowledge (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE knowledge DROP FOREIGN KEY FK_9E072E1DB3750AF4');
        $this->addSql('DROP TABLE knowledge');
    }
}

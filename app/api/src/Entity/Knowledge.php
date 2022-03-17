<?php

namespace App\Entity;

use App\Repository\KnowledgeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=KnowledgeRepository::class)
 */
class Knowledge
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity=Knowledge::class, inversedBy="knowledge")
     */
    private $parentId;

    /**
     * @ORM\OneToMany(targetEntity=Knowledge::class, mappedBy="parentId")
     */
    private $knowledge;

    /**
     * @ORM\Column(type="string", length=3000, nullable=true)
     */
    private $description;

    public function __construct()
    {
        $this->knowledge = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getParentId(): ?self
    {
        return $this->parentId;
    }

    public function setParentId(?self $parentId): self
    {
        $this->parentId = $parentId;

        return $this;
    }

    /**
     * @return Collection|self[]
     */
    public function getKnowledge(): Collection
    {
        return $this->knowledge;
    }

    public function addKnowledge(self $knowledge): self
    {
        if (!$this->knowledge->contains($knowledge)) {
            $this->knowledge[] = $knowledge;
            $knowledge->setParentId($this);
        }

        return $this;
    }

    public function removeKnowledge(self $knowledge): self
    {
        if ($this->knowledge->removeElement($knowledge)) {
            // set the owning side to null (unless already changed)
            if ($knowledge->getParentId() === $this) {
                $knowledge->setParentId(null);
            }
        }

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }
}

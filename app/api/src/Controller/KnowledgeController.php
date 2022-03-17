<?php

namespace App\Controller;

use App\Entity\Knowledge;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class KnowledgeController extends AbstractController
{
    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;

    /**
     * AdminLegalEntityController constructor.
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/knowledge", name="knowledge-get", methods={"GET"})
     */
    public function index(): Response
    {
        // $knowledges = $this->entityManager->getRepository(Knowledge::class)->findAll();
        // dd($this->entityManager->getRepository(Knowledge::class)->getClassName());
        $knowledges = $this->entityManager->getRepository(Knowledge::class)->findAll();

        return $this->json([
            'knowledgeList' => $knowledges,
            'path' => 'src/Controller/KnowledgeController.php',
        ]);
    }

    /**
     * @Route("/knowledge", name="knowledge-create", methods={"POST"})
     */
    public function create(): Response
    {
        return $this->json([
            'message' => 'success'
        ]);
    }

    /**
     * @Route("/knowledge-update", name="knowledge", methods={"POST"})
     */
    public function update(): Response
    {
        return $this->json([
            'message' => 'success'
        ]);
    }
}

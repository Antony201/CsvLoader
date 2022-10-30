package service

import (
	"test_task"
	"test_task/pkg/repository"
)

type TransactionsService struct {
	repo repository.Transaction
}

func NewTransactionsService(repo repository.Transaction) *TransactionsService {
	return &TransactionsService{repo: repo}
}

func (s *TransactionsService) Create(transactions []test_task.Transaction) (int, error) {

	for _, transaction := range transactions {
		_, err := s.repo.Create(transaction) // creating transaction in db

		if err != nil {
			return 0, err
		}
	}
	return len(transactions), nil
}

func (s *TransactionsService) GetByTransactionId(transactionId int) (test_task.Transaction, error) {
	return s.repo.GetById(transactionId)
}
CREATE TABLE transactions
(
    id serial not null unique,
    transaction_id      int not null unique,
    request_id          int not null unique,
    terminal_id         int not null unique,
    partner_object_id   int not null,
    amount_total        int not null,
    amount_original     int not null,
    commision_ps        numeric(6, 2) not null,
    commission_client   int not null,
    commission_provider numeric(6, 2) not null,
    date_input          timestamp not null,
    date_post           timestamp not null,
    status              varchar(9) not null,
    payment_type        varchar(24) not null,
    payment_number      varchar(10) not null,
    service_id          int not null unique,
    service             varchar(120) not null,
    payee_id            int not null unique ,
    payee_name          varchar(12) not null,
    payee_bank_mfo      int not null unique,
    payee_bank_account  varchar(29) not null,
    payment_narrative   varchar(125) not null
);

CREATE INDEX transactions_idx
    ON transactions(transaction_id, terminal_id);

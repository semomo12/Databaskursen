use eshop;

DROP FUNCTION IF EXISTS f_order_status;
DELIMITER ;;

CREATE FUNCTION f_order_status(
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    ordered_at DATETIME,
    shipped_at DATETIME
)
RETURNS VARCHAR(20)
BEGIN
    DECLARE status VARCHAR(20);

    IF deleted_at IS NOT NULL THEN
        SET status = 'Deleted';
        RETURN status;
    END IF;

    IF shipped_at IS NOT NULL THEN
        SET status = 'Shipped';
        RETURN status;
    END IF;

    IF updated_at is not null   THEN
        SET status = 'Updated';
        RETURN status;
    END IF;

    IF ordered_at IS NOT NULL THEN
        SET status = 'Ordered';
        RETURN status;
    END IF;

    SET status = 'Created';
    RETURN status;
END ;;
DELIMITER ;

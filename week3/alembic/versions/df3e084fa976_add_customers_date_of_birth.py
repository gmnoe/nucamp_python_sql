"""add customers date_of_birth

Revision ID: df3e084fa976
Revises: 208b33b42516
Create Date: 2023-03-07 14:33:45.713928

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'df3e084fa976'
down_revision = '208b33b42516'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )

"""set date_of_birth non-nullable

Revision ID: 395779edd7e0
Revises: df3e084fa976
Create Date: 2023-03-07 14:41:00.508961

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '395779edd7e0'
down_revision = 'df3e084fa976'
branch_labels = None
depends_on = None


def upgrade():
    """
    ALTER TABLE customers
    ALTER COLUMN date_of_birth SET NOT NULL;
    """

def downgrade():
    """
    ALTER TABLE customers
    ALTER COLUMN date_of_birth DROP NOT NULL;
    """

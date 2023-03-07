"""set date_of_birth default

Revision ID: 4c87d0b604a8
Revises: 395779edd7e0
Create Date: 2023-03-07 14:49:27.203548

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4c87d0b604a8'
down_revision = '395779edd7e0'
branch_labels = None
depends_on = None


def upgrade():
    """
    ALTER TABLE customers
    ALTER COLUMN date_of_birth SET DEFAULT now();
    """

def downgrade():
    """
    ALTER TABLE customers
        ALTER COLUMN date_of_birth DROP DEFAULT;
    """

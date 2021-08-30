"""empty message

Revision ID: 88f108fc1d57
Revises: 82cbaff4cbb8
Create Date: 2021-08-19 18:18:46.536589

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '88f108fc1d57'
down_revision = '82cbaff4cbb8'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('holding', sa.Column('amount', sa.Integer(), nullable=True))
    op.alter_column('holding', 'name',
               existing_type=sa.VARCHAR(),
               nullable=False)
    op.alter_column('holding', 'id',
               existing_type=sa.VARCHAR(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('holding', 'id',
               existing_type=sa.VARCHAR(),
               nullable=False)
    op.alter_column('holding', 'name',
               existing_type=sa.VARCHAR(),
               nullable=True)
    op.drop_column('holding', 'amount')
    # ### end Alembic commands ###
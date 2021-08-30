"""empty message

Revision ID: 2a829f4ce2f8
Revises: 
Create Date: 2021-08-15 15:28:31.831716

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '2a829f4ce2f8'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('holdings',
    sa.Column('id', sa.String(), nullable=False),
    sa.Column('name', sa.String(), nullable=True),
    sa.Column('price', sa.Integer(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.drop_table('ohcl')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('ohcl',
    sa.Column('id', sa.VARCHAR(length=10), autoincrement=False, nullable=False),
    sa.Column('open', sa.REAL(), autoincrement=False, nullable=True),
    sa.Column('high', sa.REAL(), autoincrement=False, nullable=True),
    sa.Column('low', sa.REAL(), autoincrement=False, nullable=True)
    )
    op.drop_table('holdings')
    # ### end Alembic commands ###
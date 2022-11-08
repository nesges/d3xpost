"""empty message

Revision ID: e3efbbd8fe22
Revises: c3dbfdaeb45b
Create Date: 2019-12-01 16:38:36.914779

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e3efbbd8fe22'
down_revision = 'c3dbfdaeb45b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('bridge', schema=None) as batch_op:
        batch_op.drop_column('worker_id')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('bridge', schema=None) as batch_op:
        batch_op.add_column(sa.Column('worker_id', sa.INTEGER(), nullable=True))

    # ### end Alembic commands ###
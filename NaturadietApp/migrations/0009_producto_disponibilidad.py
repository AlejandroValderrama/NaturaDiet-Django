# Generated by Django 2.2.12 on 2021-06-03 15:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('NaturadietApp', '0008_categoriaproducto_factura_pedido_producto'),
    ]

    operations = [
        migrations.AddField(
            model_name='producto',
            name='disponibilidad',
            field=models.BooleanField(default=True),
        ),
    ]

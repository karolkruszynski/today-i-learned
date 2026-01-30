# 📊 Analiza Danych - Cheat Sheet (Python + SQL)

Zbiór najważniejszych snippetów i koncepcji przydatnych w codziennej pracy analityka danych, opracowany na podstawie Twojego notebooka.

---

## 1. Połączenie z bazą PostgreSQL (SQLAlchemy)
Używamy `sqlalchemy`, aby stworzyć silnik (`engine`), który zarządza połączeniami z bazą.

```python
from sqlalchemy import create_engine

# Konfiguracja ciągu połączenia
cnxn_string = "postgresql+psycopg2://{username}:{pswd}@{host}:{port}/{database}"

engine = create_engine(
    cnxn_string.format(
        username="postgres",
        pswd="your_password",
        host="localhost",
        port="5432",
        database="your_database"
    )
)
```
**Kiedy używać:** Zawsze na początku skryptu, aby umożliwić komunikację z bazą danych.

---

## 2. Superszybki import danych (Funkcja COPY)
Standardowe `to_sql` w Pandas bywa wolne przy dużych zbiorach. Ten snippet wykorzystuje komendę `COPY` z PostgreSQL, co drastycznie przyspiesza proces.

```python
import csv
from io import StringIO

def psql_insert_copy(table, conn, keys, data_iter):
    # Pobiera bezpośrednie połączenie DBAPI
    dbapi_conn = conn.connection
    with dbapi_conn.cursor() as cur:
        s_buf = StringIO()
        writer = csv.writer(s_buf)
        writer.writerows(data_iter)
        s_buf.seek(0)
        
        columns = ', '.join('"{}"'.format(k) for k in keys)
        table_name = '{}.{}'.format(table.schema, table.name) if table.schema else table.name
        
        sql = 'COPY {} ({}) FROM STDIN WITH CSV'.format(table_name, columns)
        cur.copy_expert(sql, s_buf)

# Użycie w Pandas:
df.to_sql('nazwa_tabeli', engine, if_exists='replace', index=False, method=psql_insert_copy)
```
**Kiedy używać:** Gdy musisz wgrać do bazy więcej niż kilka tysięcy wierszy.

---

## 3. Pobieranie danych SQL do DataFrame
Najprostszy sposób, aby przenieść wynik zapytania SQL do struktur Pandas.

```python
import pandas as pd

query = "SELECT * FROM public_trans_data WHERE public_transportation_pct > 10"
df = pd.read_sql_query(query, engine)

# Szybki podgląd
print(df.head())
```
**Kiedy używać:** Gdy chcesz analizować dane z bazy przy użyciu narzędzi Pythona.

---

## 4. Mierzenie czasu wykonania kodu
W Jupyter Notebook/Lab możesz łatwo sprawdzić, jak długo wykonuje się dana komórka.

```python
%%time
df.to_sql('table_name', engine, if_exists='replace', method=psql_insert_copy)
```
**Kiedy używać:** Podczas optymalizacji kodu, aby porównać wydajność różnych podejść.

---

## 5. Podstawowa Wizualizacja (Pandas + Matplotlib)
Szybkie generowanie wykresów bezpośrednio z obiektu DataFrame.

```python
# Wykres słupkowy (Bar chart)
df.plot(kind='bar', rot=0)

# Histogram dla rozkładu wartości
df.plot.hist(y='nazwa_kolumny', bins=20)
```
**Kiedy używać:** Do szybkiej eksploracji danych (EDA) i wizualizacji trendów czy rozkładów.

---

## 6. Eksport do CSV
Zapisywanie przetworzonych danych do pliku, który można otworzyć np. w Excelu.

```python
df.to_csv('E:\\wyniki_analizy.csv', index=False)
```
**Kiedy używać:** Gdy musisz udostępnić wyniki innym osobom lub procesom.

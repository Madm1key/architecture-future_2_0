---
title: "CDC (Change Data Capture)"
ring: trial
quadrant: methods-and-patterns
tags: [integration, new]
---

Паттерн потоковой репликации изменений из операционных БД в Lakehouse без полного дампа. Используется для загрузки исторических данных из DWH и потоковой синхронизации доменных хранилищ.

**Бизнес-сценарии:** историческая загрузка данных из Legacy DWH в Lakehouse без остановки сервисов; потоковая загрузка событий из PostgreSQL доменов в Bronze-слой.

package com.example.todo.domain.repository.todo;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Repository;

import com.example.todo.domain.model.Todo;

// Repositoryとしtcomponent-scan対象とするため、クラスレベルに@Repositoryあdのテーションをつける
@Repository
public class TodoRepositoryImpl implements TodoRepository {
	private static final Map<String, Todo> TODO_MAP = new ConcurrentHashMap<String, Todo>();
	

	

	// TODOの1件取得
	@Override
	public Optional<Todo> findById(String todoId) {
		return Optional.ofNullable(TODO_MAP.get(todoId));

	}

	// TODOの全件取得
	@Override
	public Collection<Todo> findAll() {
		return TODO_MAP.values();
	}

	// TODOの1件作成
	@Override
	public void create(Todo todo) {
		TODO_MAP.put(todo.getTodoId(), todo);
	}

	// TODOの1件作成
	@Override
	public boolean updateById(Todo todo) {
		TODO_MAP.put(todo.getTodoId(), todo);
		return true;
	}

	// TODOの1件削除
	@Override
	public void deleteById(Todo todo) {
		TODO_MAP.remove(todo.getTodoId());
	}

	// 完了済みTODO件数の取得
	@Override
	public long countByFinished(boolean finished) {
		long count = 0;
		for (Todo todo : TODO_MAP.values()) {
			if (finished == todo.isFinished()) {
				count++;
			}
		}
		return count;
	}

}

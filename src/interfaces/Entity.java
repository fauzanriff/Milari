package interfaces;

/* Merupakan kelas yang dapat di CRUD dari database */
public interface Entity {
    
    public Entity create();
    public Entity read();
    public void update(Entity oldEntity, Entity newEntity);
    public void _delete(Entity deletedEntity);
    
}

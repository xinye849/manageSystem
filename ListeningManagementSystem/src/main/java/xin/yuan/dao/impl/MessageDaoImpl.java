package xin.yuan.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import xin.yuan.dao.MessageDao;

import xin.yuan.entity.Message;
import xin.yuan.entity.Student;

import java.util.List;

/**
 * @authorknightx
 * @create2019/1/19
 * @since 1.0.0
 */
public class MessageDaoImpl extends HibernateDaoSupport implements MessageDao {
    @Override
    //拿到当前学生的总交流信息数
    public int findTotalRecordsBystudent(final Student student) {
        String hql = "select count(*) from Message  where stuId=?0";
        Integer id = new Integer(String.valueOf(student.getStuId()));
       Number count = (Number)getHibernateTemplate().find(hql,id).listIterator().next();

        return count.intValue();

        /*return (int)getHibernateTemplate().execute(
                new HibernateCallback(){
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException
                    {//order by levelWordTime desc
                        String hql = "select count(*) from Message where stuId=:stuId";
                       Integer id = new Integer(String.valueOf(student.getStuId()));
                        Query query = session.createQuery(hql);
                        query.setParameter("stuId",id);
                        List list =query.list();

                        Long count =(Long)list.listIterator().next();
                        System.out.println("count======="+count);
                        Integer countt= new Integer(String.valueOf(count));
                        return countt.intValue();


                    }

                });
                 */

    }

    @Override
    public List findMessageWithPage(final int startIndex, final int pageSize, final Student student) {


        return (List)getHibernateTemplate().execute(
                new HibernateCallback(){
                    @Override
                    public Object doInHibernate(Session session) throws HibernateException
                    {//order by levelWordTime desc
                        Query query = session.createQuery("from Message where stuId=:stuId order by levelWordTime desc");
                        Integer id = new Integer(String.valueOf(student.getStuId()));
                        query.setParameter("stuId",id);
                        query.setFirstResult(startIndex);
                        query.setMaxResults(pageSize);

                        return query.list();

                    }

                });

    }

    @Override
    public void addMessage(Message message) {
        getHibernateTemplate().save(message);
    }

    @Override
    public int findTotalRecords() {

        String hql = "select count(*) from Message";
        Number count = (Number)getHibernateTemplate().find(hql).listIterator().next();
        return count.intValue();
    }

    @Override
    public List<Message> findMessageWithPageByTeacher(final int startIndex, final int pageSize) {



        return (List<Message>)getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Message order by levelWordTime desc");
                query.setFirstResult(startIndex);
                query.setMaxResults(pageSize);


                return query.list();
            }
        });
    }

    @Override
    public void replayMessage(Message message) {
        Message msg = getHibernateTemplate().get(Message.class,message.getMessageId());
        msg.setReplay(message.getReplay());
        msg.setReplayTime(message.getReplayTime());



        getHibernateTemplate().update(msg);
    }

    @Override
    public List<Message> findAllMessages(final int startIndex, final int pageSize) {
        return (List<Message>)getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Message order by levelWordTime desc");
                query.setFirstResult(startIndex);
                query.setMaxResults(pageSize);


                return query.list();
            }
        });
    }

    @Override
    public Message teacherResponseById(Message message) {

        return getHibernateTemplate().get(message.getClass(),message.getMessageId());
    }


}

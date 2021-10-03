using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class move : MonoBehaviour
{
     
     public float speed = 20f;
     public Rigidbody2D rb2d;

     void Update()
     {
        rb2d.velocity = transform.right * speed;
        //transform.Translate((transform.forward * speed * Time.deltaTime));
     }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.name == "death")
            Destroy(gameObject);
        if (collision.name == "meteor(Clone)")
            Destroy(gameObject);
       }
}

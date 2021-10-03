using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class move_2 : MonoBehaviour
{
    public saude saude;
    public int hp;
    public float speed = -20f;
    public Rigidbody2D rb2d;

    void Update()
    {
        rb2d.velocity = transform.right * speed;
        if (hp <= 0)
            Destroy(gameObject);
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.name == "death_meteor")
            Destroy(gameObject);
        if (collision.name == "lazer(Clone)")
        {
            hp = hp - 1;
        }
        if (collision.name == "ship")
        {
            Destroy(gameObject);
            saude.hp = saude.hp - 1;
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawn_meteor : MonoBehaviour
{
    public GameObject meteor;
    float spawn_rate = 2.0f;
    public float defualt_spawn_rate = 2.0f;

    // Update is called once per frame
    void Update()
    {
        spawn_rate -= Time.deltaTime;

        if (spawn_rate <= 0.0f)
        {
            Vector2 pos = new Vector2(30, Random.Range(-5, 5));
            Instantiate(meteor, pos, transform.rotation);
            spawn_rate = defualt_spawn_rate;
        }
    }
}

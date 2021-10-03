using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class saude : MonoBehaviour
{
    public int hp = 3;

    // Update is called once per frame
    void Update()
    {
        if (hp <= 0)
            Destroy(gameObject);
            Destruction();
    }

    void Destruction()
    {

    }
}

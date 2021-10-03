using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shoot : MonoBehaviour
{
    public GameObject ship;
    public GameObject lazer;
    void Update()
    {
        if (Input.GetKeyDown("space"))
        {
            Instantiate(lazer, ship.transform.position, ship.transform.rotation);
        }
    }
}

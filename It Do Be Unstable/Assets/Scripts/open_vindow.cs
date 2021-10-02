using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class open_vindow : MonoBehaviour
{
    private Animation anime;

    private void Start()
    {
        anime = gameObject.GetComponent<Animation>();
    }

    private void Update()
    {
         if (Input.GetMouseButtonDown(0)) {
             Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
             Vector2 mousePos2D = new Vector2(mousePos.x, mousePos.y);

             RaycastHit2D hit = Physics2D.Raycast(mousePos2D, Vector2.zero);
             if (hit.collider?.gameObject.name == "ship_icon") {
                Debug.Log(hit.collider.gameObject.name);
                anime.Play("ship_selected");
             }
         }
    }
    
}

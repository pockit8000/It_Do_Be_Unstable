using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class open_vindow : MonoBehaviour
{
    float clicked = 0;
    float clicktime = 0;
    float clickdelay = 0.5f;
    private Animator anime;
    public GameObject open;
    private SpriteRenderer sprite;

    private void Start()
    {
        anime = gameObject.GetComponent<Animator>();
        sprite = open.GetComponent<SpriteRenderer>();
    }

    private void Update()
    {
         if (Input.GetMouseButtonDown(0)) { // mouse click
             Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
             Vector2 mousePos2D = new Vector2(mousePos.x, mousePos.y);

             RaycastHit2D hit = Physics2D.Raycast(mousePos2D, Vector2.zero);
             if (hit.collider?.gameObject.name == "ship_icon") { //check to see what object it is
                Debug.Log(hit.collider.gameObject.name);
                anime.Play("base layer.ship_selected", 0, 0.25f);
                    clicked++;
                    if (clicked == 1) clicktime = Time.time;
                    if (clicked > 1 && Time.time - clicktime < clickdelay)  //double click
                    {
                        clicked = 0;
                        clicktime = 0;
                        Debug.Log("Double CLick!");
                        sprite.enabled = true;
                    }
                    else if (clicked > 2 || Time.time - clicktime > 1)
                    clicked = 0;
            }
             else
            {
                anime.Play("base layer.ship_unselected", 0, 0.25f);
            }
         }
    }
    
}
